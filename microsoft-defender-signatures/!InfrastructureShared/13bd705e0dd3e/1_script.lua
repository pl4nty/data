-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\13bd705e0dd3e\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 ~= nil then
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC18: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC19: Overwrote pending register: R3 in 'AssignReg'

  if not ("curl")(l_0_1, l_0_2) then
    return mp.CLEAN
  end
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC31: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC32: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC33: Overwrote pending register: R5 in 'AssignReg'

  if not ("bash")("xattr", l_0_3) then
    return mp.CLEAN
  end
end
do
  return mp.INFECTED
end

