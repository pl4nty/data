-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35d0baf20439\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC4: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC5: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("cache").getfilename)()
-- DECOMPILER ERROR at PC10: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC12: Overwrote pending register: R3 in 'AssignReg'

if l_0_1 then
  l_0_1 = (("-wal").lower)("\\temp\\")
  if contains(l_0_1, l_0_0) then
    return mp.CLEAN
  end
end
local l_0_2 = (mp.getfilesize)()
do
  if l_0_2 < 16777216 then
    local l_0_3, l_0_4 = l_0_2
  end
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R3 in 'UnsetPending'

  local l_0_5 = nil
  if (mp.BMSearchFile)(0, l_0_3, "󠁮󠁳󠁴󠁲󠁵󠁣󠁴󠁩󠁯󠁮\144\000") < 0 then
    return mp.INFECTED
  end
  do
    if (mp.BMSearchFile)(0, l_0_3, "󠁮󠁳󠁴󠁲󠁵󠁣󠁴󠁩󠁯󠁮\144\000") - 80 < 0 then
      local l_0_6 = nil
    end
    local l_0_7 = nil
    ;
    (mp.readprotection)(false)
    local l_0_8 = nil
    ;
    (mp.readprotection)(true)
    local l_0_9 = nil
    set_research_data("EncodedBytes", (MpCommon.Base64Encode)((mp.readfile)(0, 256)), false)
    return mp.INFECTED
  end
end

