-- Threat: !InfrastructureShared
-- Name: 2d4177604e78
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].p2
  if l_0_0 == nil or l_0_0 == "" or 300 <= #l_0_0 then
    return mp.CLEAN
  end
  l_0_0 = string.lower(l_0_0)
  l_0_0 = l_0_0:match("^%s*(.-)%s*$")
  if #l_0_0 <= 20 then
    return mp.CLEAN
  end
  local l_0_1 = {
    {
      key = "powershell",
      pat = "p([a-z0-9]-)o([a-z0-9]-)w([a-z0-9]-)e([a-z0-9]-)r([a-z0-9]-)s([a-z0-9]-)h([a-z0-9]-)e([a-z0-9]-)l([a-z0-9]-)l"
    },
    {
      key = "rundll",
      pat = "r([a-z0-9]{0,10})u([a-z0-9]{0,10})n([a-z0-9]{0,10})d([a-z0-9]{0,10})l([a-z0-9]{0,10})l"
    },
    {
      key = "mshta",
      pat = "m([a-z0-9]{0,10})s([a-z0-9]{0,10})h([a-z0-9]{0,10})t([a-z0-9]{0,10})a"
    },
    {
      key = "wscript",
      pat = "w([a-z0-9]{0,10})s([a-z0-9]{0,10})c([a-z0-9]{0,10})r([a-z0-9]{0,10})i([a-z0-9]{0,10})p([a-z0-9]{0,10})t"
    }
  }
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    local l_0_4 = {
      string.match(l_0_0, l_0_3.pat)
    }
    if l_0_4[1] and not string.find(l_0_0, l_0_3.key, 1, true) then
      for l_0_5 = 1, #l_0_4 do
        local l_0_6 = l_0_4[l_0_5]
        if l_0_6 ~= "" and 2 <= #l_0_6 and #l_0_6 < 20 and string.match(l_0_6, "^[a-z0-9]+$") then
          local l_0_7 = string.gsub(l_0_0, l_0_6, "")
          if string.match(l_0_7, "%f[%w]" .. l_0_3.key .. "%f[%W]") then
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
