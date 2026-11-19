-- Threat: !InfrastructureShared
-- Name: !#Lua:JsObfusFake.A
-- Type: 13

local l_0_0 = mp.getfilename()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = string.sub(l_0_0, -3)
  local l_0_2 = string.sub(l_0_0, -4)
  if l_0_1 == ".js" or l_0_2 == ".jse" or l_0_2 == ".vbs" or l_0_2 == ".vbe" or l_0_2 == ".wsf" then
    local l_0_3 = 0
    if mp.get_mpattributesubstring("SCPT:Trojan:JS/PikaBot.BX") then
      l_0_3 = l_0_3 + 2
    end
    if mp.get_mpattributesubstring("SCPT:JS/AsrobfusWscrExec") then
      l_0_3 = l_0_3 + 2
    end
    if mp.get_mpattributesubstring("SCRIPT:ToStringCode.A") then
      l_0_3 = l_0_3 + 1
    end
    if mp.get_mpattributesubstring("SCPT:VBSSplit") then
      l_0_3 = l_0_3 + 1
    end
    if 5 <= l_0_3 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
