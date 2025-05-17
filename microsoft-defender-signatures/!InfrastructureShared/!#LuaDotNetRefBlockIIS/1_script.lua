-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaDotNetRefBlockIIS\1_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:IsDotNetAMSIScan_IIS") then
  return mp.CLEAN
end
if (mp.get_mpattributesubstring)("Detection:PUA:") then
  return mp.CLEAN
end
local l_0_0 = (mp.enum_mpattributesubstring)("Lua:PeOriginalName!")
if not l_0_0 or #l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1 = (mp.enum_mpattributesubstring)("Detection:")
local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if not l_0_2 or not l_0_3 then
  return mp.CLEAN
end
local l_0_4, l_0_5 = nil, nil
if #l_0_0 == 1 then
  l_0_4 = l_0_0[#l_0_0]
  if l_0_4 ~= nil then
    l_0_4 = ((string.lower)(l_0_4)):match("lua:peoriginalname!(.*)$")
  end
end
if l_0_1 and #l_0_1 ~= 0 then
  l_0_5 = l_0_1[#l_0_1]
  if l_0_5 ~= nil then
    l_0_5 = ((string.lower)(l_0_5)):match("detection:(.*)$")
  end
end
if l_0_4 and l_0_5 then
  TT_SendBMSigTrigger(l_0_3, "IIS_InMemoryLoadBlocked", l_0_5 .. ";" .. l_0_4, 2)
end
return mp.CLEAN

