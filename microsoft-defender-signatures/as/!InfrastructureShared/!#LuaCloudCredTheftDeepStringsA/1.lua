-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaCloudCredTheftDeepStringsA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if isnull(l_0_0) or l_0_0 == 0 then
  return mp.CLEAN
end
if l_0_0 < 5242880 then
  return mp.CLEAN
end
if isnull(pehdr) or isnull(pehdr.NumberOfSections) then
  return mp.CLEAN
end
local l_0_1 = 536870912
local l_0_2 = 3145728
local l_0_3 = false
local l_0_4 = false
local l_0_5 = false
local l_0_6 = false
local l_0_7 = false
for l_0_11 = 1, pehdr.NumberOfSections do
  if l_0_2 <= 0 then
    break
  end
  local l_0_12 = pesecs[l_0_11]
  if not isnull(l_0_12) and not isnull(l_0_12.PointerToRawData) and not isnull(l_0_12.SizeOfRawData) and l_0_12.SizeOfRawData > 0 then
    local l_0_13 = false
    l_0_13 = isnull(l_0_12.Characteristics) or (mp.bitand)(l_0_12.Characteristics, l_0_1) ~= 0
    do
      if l_0_2 < l_0_12.SizeOfRawData then
        local l_0_14, l_0_15, l_0_16 = l_0_2
      end
      -- DECOMPILER ERROR at PC89: Confused about usage of register: R14 in 'UnsetPending'

      if not l_0_13 and l_0_12.PointerToRawData + l_0_14 <= l_0_0 then
        (mp.readprotection)(false)
        -- DECOMPILER ERROR at PC99: Confused about usage of register: R14 in 'UnsetPending'

        local l_0_17 = nil
        ;
        (mp.readprotection)(true)
        if not isnull((mp.readfile)(l_0_12.PointerToRawData, l_0_14)) then
          if (string.find)(tostring((mp.readfile)(l_0_12.PointerToRawData, l_0_14)), "169.254.169.254", 1, true) then
            l_0_3 = true
          end
          -- DECOMPILER ERROR at PC127: Confused about usage of register: R15 in 'UnsetPending'

          if (string.find)(tostring((mp.readfile)(l_0_12.PointerToRawData, l_0_14)), "/latest/meta-data/iam/security-credentials/", 1, true) then
            l_0_4 = true
          end
          -- DECOMPILER ERROR at PC137: Confused about usage of register: R15 in 'UnsetPending'

          if (string.find)(tostring((mp.readfile)(l_0_12.PointerToRawData, l_0_14)), "age-encryption.org/v1", 1, true) then
            l_0_5 = true
          end
          -- DECOMPILER ERROR at PC147: Confused about usage of register: R15 in 'UnsetPending'

          if (string.find)(tostring((mp.readfile)(l_0_12.PointerToRawData, l_0_14)), "\\rust-s3-", 1, true) then
            l_0_6 = true
          end
          -- DECOMPILER ERROR at PC157: Confused about usage of register: R15 in 'UnsetPending'

          if (string.find)(tostring((mp.readfile)(l_0_12.PointerToRawData, l_0_14)), "\\aws-creds-", 1, true) then
            l_0_7 = true
          end
        end
      end
      -- DECOMPILER ERROR at PC165: LeaveBlock: unexpected jumping out DO_STMT

      -- DECOMPILER ERROR at PC165: LeaveBlock: unexpected jumping out IF_THEN_STMT

      -- DECOMPILER ERROR at PC165: LeaveBlock: unexpected jumping out IF_STMT

    end
  end
end
do
  if (l_0_5 and not l_0_6) or l_0_7 then
    local l_0_18 = 0 + 1 + 1 + 1
  end
  do
    local l_0_19 = nil
    if l_0_3 and l_0_4 then
      (mp.set_mpattribute)("Lua:CloudCredTheft.Imds.A")
    end
    if l_0_19 >= 2 then
      (mp.set_mpattribute)("Lua:CloudCredTheft.ExfilStack.A")
    end
    if not true then
      return mp.CLEAN
    end
    set_research_data("cct_size", tostring(l_0_0), false)
    set_research_data("cct_crates", tostring(l_0_19), false)
    do return mp.INFECTED end
    -- DECOMPILER ERROR: 15 unprocessed JMP targets
  end
end

