local lint = require 'lint'
lint.linters_by_ft = lint.linters_by_ft or {}

-- default rule requires:
-- clojure: clj-kondo
-- dockerfile: hadolint
-- inko: inko
-- janet: janet
-- json: jsonlint
-- markdown: vale
-- rst: vale
-- ruby: ruby
-- terraform: tflint
-- text: vale

-- disable default
lint.linters_by_ft['clojure'] = nil
lint.linters_by_ft['rst'] = nil
lint.linters_by_ft['ruby'] = nil
lint.linters_by_ft['terraform'] = nil
lint.linters_by_ft['inko'] = nil
lint.linters_by_ft['janet'] = nil
-- lint.linters_by_ft['dockerfile'] = nil
-- lint.linters_by_ft['json'] = nil
-- lint.linters_by_ft['text'] = nil

-- set linters
-- lint.linters_by_ft['markdown'] = { 'markdownlint' }

-- actual linting
local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    -- Only run the linter in buffers that you can modify in order to
    -- avoid superfluous noise, notably within the handy LSP pop-ups that
    -- describe the hovered symbol using Markdown.
    if vim.opt_local.modifiable:get() then
      lint.try_lint()
    end
  end,
})
