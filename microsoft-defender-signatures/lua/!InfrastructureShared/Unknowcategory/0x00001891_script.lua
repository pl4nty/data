-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00001891_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0 ~= nil then
  l_0_0 = (string.lower)(l_0_0)
  local l_0_1 = (string.sub)(l_0_0, -3)
  local l_0_2 = (string.sub)(l_0_0, -4)
  if (l_0_1 == ".js" or l_0_2 == ".jse" or l_0_2 == ".vbs" or l_0_2 == ".vbe" or l_0_2 == ".wsf") and (((((mp.get_mpattributesubstring)("SCPT:Trojan:JS/PikaBot.BX") and not (mp.get_mpattributesubstring)("SCPT:JS/AsrobfusWscrExec")) or (mp.get_mpattributesubstring)("SCRIPT:ToStringCode.A")) and not (mp.get_mpattributesubstring)("SCPT:VBSSplit")) or 0 + 2 + 2 + 1 + 1 >= 5) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

