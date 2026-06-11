-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELVirToolWin32VoidBridgeconf\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0[135105627] = "SCPT:GoatBridge"
l_0_0[4032033915] = "SCPT:HardBridge"
l_0_0[3730411570] = "SCPT:NullBridge"
l_0_0[2080484669] = "SCPT:SpikeBridge"
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_CNAME))
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
for l_0_5,l_0_6 in pairs(l_0_0) do
  local l_0_7 = (mp.enum_mpattributesubstring)(l_0_6)
  local l_0_8 = {}
  for l_0_12 = 1, #l_0_7 <= 32 and #l_0_7 or 32 do
    local l_0_13 = (l_0_7[l_0_12]):match("%.(%u+)$")
    if l_0_13 and #l_0_13 <= 3 then
      l_0_8[#l_0_8 + 1] = l_0_13
    end
  end
  if #l_0_8 > 0 then
    (table.sort)(l_0_8)
    ;
    (mp.set_mpattribute)("MpInternal_researchdata=SCPTSFX=" .. (table.concat)(l_0_8, ":"))
    ;
    (mp.ReportLowfi)(l_0_1, l_0_5)
  end
end
return mp.CLEAN

