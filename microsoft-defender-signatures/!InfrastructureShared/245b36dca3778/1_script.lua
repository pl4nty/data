-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\245b36dca3778\1_luac 

-- params : ...
-- function num : 0
if (MpCommon.NidSearch)(mp.NID_ENABLE_EXTENDED_BAFS, 6) then
  (bm.add_related_string)("AdditionalInfo", "E5EmergencyAntiTampering", bm.RelatedStringBMReport)
  return mp.INFECTED
end
local l_0_0 = {}
local l_0_1 = {}
-- DECOMPILER ERROR at PC22: No list found for R1 , SetList fails

local l_0_2 = {}
-- DECOMPILER ERROR at PC24: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC26: No list found for R2 , SetList fails

local l_0_3 = {}
-- DECOMPILER ERROR at PC28: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC30: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC31: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC33: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC40: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC41: Overwrote pending register: R2 in 'AssignReg'

if not l_0_1 or not l_0_2 then
  return l_0_2
end
-- DECOMPILER ERROR at PC43: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC45: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC46: Overwrote pending register: R5 in 'AssignReg'

l_0_2 = l_0_2(l_0_3, "", "")
local l_0_4, l_0_5 = nil
if l_0_2 then
  return mp.CLEAN
end
local l_0_6 = {}
-- DECOMPILER ERROR at PC56: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC57: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC60: Overwrote pending register: R8 in 'AssignReg'

local l_0_7 = ((("bcdedit.exe").get_imagepath)()):match("([^\\]+)$")
if not l_0_7 then
  return mp.CLEAN
end
l_0_7 = l_0_7:lower()
for l_0_11,l_0_12 in ipairs(l_0_6) do
  if (string.find)(l_0_7, l_0_12) then
    local l_0_13 = add_parents()
    local l_0_14 = {}
    for l_0_18,l_0_19 in ipairs(l_0_13) do
      local l_0_20 = l_0_19:match("([^\\]+)$")
      ;
      (table.insert)(l_0_14, l_0_20)
    end
    local l_0_21 = GetRollingQueueKeys("NewlyRegisteredServices")
    if l_0_21 then
      for l_0_25,l_0_26 in ipairs(l_0_21) do
        if contains(l_0_26, l_0_14) then
          (bm.add_related_string)("RegisteredSrv", l_0_26, bm.RelatedStringBMReport)
          break
        end
      end
    end
    do
      do
        local l_0_27 = reportRelevantUntrustedEntities(0)
        if l_0_27 and next(l_0_27) then
          (bm.add_related_string)("HasUntrustedEntities", "true", bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(l_0_27), bm.RelatedStringBMReport)
        end
        do return mp.INFECTED end
        -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC153: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end
return mp.CLEAN

