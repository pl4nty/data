-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLinuxBlackCatN\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC44: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC45: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC46: Overwrote pending register: R3 in 'AssignReg'

for l_0_5,l_0_6 in ("/ansible")("/snap/") do
  -- DECOMPILER ERROR at PC49: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC51: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC52: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC53: Overwrote pending register: R10 in 'AssignReg'

  if (("/tmp/go-build").find)("/var/intel", "/var/cache", "/var/arcticwolfnetworks", true) then
    return mp.CLEAN
  end
end
do
  local l_0_7 = {}
  -- DECOMPILER ERROR at PC67: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC69: Overwrote pending register: R4 in 'AssignReg'

  for l_0_11,l_0_12 in ("/scripts/smb_common.py")("/scripts/smb_copy_and_exec.py") do
    if l_0_0:sub(-1 * #l_0_12) == l_0_12 then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

