return {
  {
    "ibhagwan/fzf-lua",
    config = function ()
      require("fzf-lua").setup({
        "fzf-native",
        fzf_colors = true,
        winopts = {
          preview = {
            border = "noborder",
            delay = 250,
          }
        },
        previewers = {
          bat = {
            cmd = "bat",
            theme = "Material-Dark"
          }
        }
      })
    end
  }
}
