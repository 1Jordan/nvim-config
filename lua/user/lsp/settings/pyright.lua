local status_ok, lspcontainers = pcall(require, "lspcontainers")
if not status_ok then
  return
end

local ros_project = "/home/jordan/autonomous-vehicle"

local settings = {
  python = {
    analysis = {
      typeCheckingMode = "off",
    },
  },
}

local ros_development = {
  settings = settings,
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

local normal = {
  settings = settings,
}

local function startswith(text, prefix)
  return text:find(prefix, 1, true) == 1
end

local path = vim.fn.getcwd()

if startswith(path, ros_project) then
  return ros_development
else
  return normal
end
