local status_ok, lspcontainers = pcall(require, "lspcontainers")
if not status_ok then
	return
end

return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
	before_init = function(params)
		params.processId = vim.NIL
	end,
	root_dir = require("lspconfig/util").root_pattern(".git", vim.fn.getcwd()),
	cmd = lspcontainers.command("pyright", {
		image = "dev_image_lsp:foxy",
		cmd = function(runtime, volume, image)
			return {
				runtime,
				"container",
				"run",
				"--interactive",
				"--rm",
				"--volume",
				volume,
				image,
			}
		end,
	}),
}
