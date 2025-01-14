local M = {}

local format = vim.fn.fnamemodify

function M.relative_path(loc)
    return format(loc, ":.")
end

function M.filename(loc)
    return format(loc, ":t")
end

function M.filestem(loc)
    return format(loc, ":t:r")
end

function M.format(loc, fmt)
    if fmt == "absolute" then
        return loc
    elseif fmt == "relative" then
        return M.relative_path(loc)
    elseif fmt == "filename" then
        return M.filename(loc)
    elseif fmt == "filestem" then
        return M.filestem(loc)
    else
        vim.api.nvim_err_writeln("Invalid path format: " .. fmt)
        return nil
    end
end

return M
