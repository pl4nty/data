-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35d0baf20439\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 268435456 then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC13: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC14: Overwrote pending register: R2 in 'AssignReg'

local l_0_2 = (("cache").getfilename)()
-- DECOMPILER ERROR at PC19: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC21: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC26: Overwrote pending register: R5 in 'AssignReg'

if l_0_2 and contains(l_0_2, ".tmp") then
  return mp.CLEAN
end
do
  if l_0_0 < 16777216 then
    local l_0_3, l_0_4 = l_0_0
  end
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R3 in 'UnsetPending'

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
    set_research_data("EncodedBytes", (MpCommon.Base64Encode)((mp.readfile)(0, 512)), false)
    return mp.INFECTED
  end
end

