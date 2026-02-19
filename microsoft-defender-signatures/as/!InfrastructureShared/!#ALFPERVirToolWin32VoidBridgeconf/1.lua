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
  if #l_0_6 > 0 then
    local l_0_7 = {}
    for l_0_11,l_0_12 in ipairs(l_0_6) do
      local l_0_13 = l_0_12:match("%.(%u+)$")
      if l_0_13 and #l_0_13 <= 3 then
        l_0_7[#l_0_7 + 1] = l_0_13
      end
    end
    do
      if #l_0_7 > 32 or not #l_0_7 then
        do
          local l_0_14 = (table.concat)(l_0_7, ":", 1, #l_0_7 <= 0 or 32)
          ;
          (mp.set_mpattribute)("MpInternal_researchdata=SCPTSFX=" .. l_0_14)
          ;
          (mp.changedetectionname)(l_0_4)
          do return mp.INFECTED end
          -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
return mp.CLEAN

