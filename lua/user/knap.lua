local status_ok, knap = pcall(require, "knap")
if not status_ok then
  return
end

-- set shorter name for keymap function
local kmap = vim.keymap.set

-- F5 processes the document once, and refreshes the view
kmap('i','<F5>', function() knap.process_once() end)
kmap('v','<F5>', function() knap.process_once() end)
kmap('n','<F5>', function() knap.process_once() end)

-- F6 closes the viewer application, and allows settings to be reset
kmap('i','<F6>', function() knap.close_viewer() end)
kmap('v','<F6>', function() knap.close_viewer() end)
kmap('n','<F6>', function() knap.close_viewer() end)

-- F7 toggles the auto-processing on and off
kmap('i','<F7>', function() knap.toggle_autopreviewing() end)
kmap('v','<F7>', function() knap.toggle_autopreviewing() end)
kmap('n','<F7>', function() knap.toggle_autopreviewing() end)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
kmap('i','<F8>', function() knap.forward_jump() end)
kmap('v','<F8>', function() knap.forward_jump() end)
kmap('n','<F8>', function() knap.forward_jump() end)

local gknapsettings = {
    htmloutputext = "html",
    htmltohtml = "none",
    htmltohtmlviewerlaunch = "brave %outputfile%",
    htmltohtmlviewerrefresh = "none",
    mdoutputext = "pdf",
    mdtohtml = "pandoc --standalone %docroot% -o %outputfile%",
    mdtohtmlviewerlaunch = "brave %outputfile%",
    mdtohtmlviewerrefresh = "none",
    mdtopdf = "pandoc %docroot% -o %outputfile%",
    mdtopdfviewerlaunch = "sioyek %outputfile%",
    mdtopdfviewerrefresh = "none",
    markdownoutputext = "pdf",
    markdowntohtml = "pandoc --standalone %docroot% -o %outputfile%",
    markdowntohtmlviewerlaunch = "brave %outputfile%",
    markdowntohtmlviewerrefresh = "none",
    markdowntopdf = "pandoc %docroot% -o %outputfile%",
    markdowntopdfviewerlaunch = "sioyek %outputfile%",
    markdowntopdfviewerrefresh = "none",
    texoutputext = "pdf",
    textopdf = "pdflatex -interaction=batchmode -halt-on-error -synctex=1 %docroot%",
    textopdfviewerlaunch = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --reuse-instance %outputfile%",
    textopdfviewerrefresh = "none",
    textopdfforwardjump = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --reuse-instance --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",
    textopdfshorterror = "A=%outputfile% ; LOGFILE=\"${A%.pdf}.log\" ; rubber-info \"$LOGFILE\" 2>&1 | head -n 1",
    delay = 250
}

vim.g.knap_settings = gknapsettings
