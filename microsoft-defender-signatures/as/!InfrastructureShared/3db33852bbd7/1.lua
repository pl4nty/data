-- Threat: !InfrastructureShared
-- Name: 3db33852bbd7
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2:lower()
  local l_0_1 = 0
  l_0_0 = l_0_0:match("\\powershell%.exe\"(.+)$")
  if l_0_0 ~= nil then
    l_0_0 = l_0_0 .. " "
    l_0_0, l_0_1 = l_0_0:gsub("(%s%w:)%s", " ")
    if l_0_1 == 1 then
      l_0_0, l_0_1 = l_0_0:gsub("(%ssuspend%-bitlocker)%s", " ")
      if l_0_1 == 1 then
        l_0_0 = l_0_0:gsub(" ", "")
        if l_0_0 == "" then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
