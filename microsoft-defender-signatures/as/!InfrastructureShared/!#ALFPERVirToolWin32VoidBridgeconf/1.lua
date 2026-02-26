-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFPERVirToolWin32VoidBridgeconf\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0[2460690537] = "SCPT:GoatBridge"
l_0_0[1794461769] = "SCPT:HardBridge"
l_0_0[3011729072] = "SCPT:NullBridge"
for l_0_4,l_0_5 in pairs(l_0_0) do
  local l_0_6 = (mp.enum_mpattributesubstring)(l_0_5)
  local l_0_7 = {}
  for l_0_11 = 1, #l_0_6 <= 32 and #l_0_6 or 32 do
    local l_0_12 = (l_0_6[l_0_11]):match("%.(%u+)$")
    if l_0_12 and #l_0_12 <= 3 then
      l_0_7[#l_0_7 + 1] = l_0_12
    end
  end
  if #l_0_7 > 0 then
    (table.sort)(l_0_7)
    ;
    (mp.set_mpattribute)("MpInternal_researchdata=SCPTSFX=" .. (table.concat)(l_0_7, ":"))
    ;
    (mp.changedetectionname)(l_0_4)
    return mp.INFECTED
  end
end
return mp.CLEAN

