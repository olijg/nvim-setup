local ls = require("luasnip")
local s = ls.snippet()
local t = ls.text_node()

s(
  {
    trig="get",
    dscr="Build a basic GET HTTP request",
    regTrig=false,
    priority=100,
    snippetType="autosnippet"
  },
  {
    t("###\nGET {URL}\n\n###")
  }
)
