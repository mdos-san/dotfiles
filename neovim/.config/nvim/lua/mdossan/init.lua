local mdossan = {}

function mdossan.findFile()
    local fzf = require("fzf")

    coroutine.wrap(function()
        local result = fzf.fzf('find . -type f -not -path "*/node_modules/*" -not -path "*/target/*" -not -path "*.git/*" | xargs realpath')
        local cmd = "edit " .. result[1];
        print(cmd);
        vim.api.nvim_command(cmd);
    end)()
end

function mdossan.testCurrentFile()
    local path = vim.api.nvim_buf_get_name(0);
    vim.cmd("!tefps-test %");
    print(path);
end

return mdossan
