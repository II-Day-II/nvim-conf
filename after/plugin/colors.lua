function set_color(color)
    color = color or "rose-pine"
    if color == "rose-pine" then
        require(color).setup({
            dark_variant = 'moon',
            bold_vert_split = true,
            disable_background = true,
            disable_float_background = false,
            dim_nc_background = false,
            disable_italics = true,
        })
    end
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    return color
end

G_color = set_color()
