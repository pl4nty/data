-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLinuxBlackCatO\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC29: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC30: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

for l_0_5,l_0_6 in ("/usr/")("/var/lib/") do
  -- DECOMPILER ERROR at PC34: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC34: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC35: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC36: Overwrote pending register: R10 in 'AssignReg'

  if ("/opt/")("/etc/", "/snap/", "/proc/") == l_0_6 then
    return mp.CLEAN
  end
end
local l_0_7 = {}
-- DECOMPILER ERROR at PC54: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC71: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC72: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC73: Overwrote pending register: R4 in 'AssignReg'

for l_0_11,l_0_12 in ("/ansible")("/snap/") do
  -- DECOMPILER ERROR at PC76: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R11 in 'AssignReg'

  if (("/tmp/go-build").find)("/var/intel", "/var/cache", "/sbin/", true) then
    return mp.CLEAN
  end
end
do
  local l_0_13 = {}
  -- DECOMPILER ERROR at PC93: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC94: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC95: Overwrote pending register: R5 in 'AssignReg'

  for l_0_17,l_0_18 in ("/app/controller")("/app/payload") do
    if l_0_0:sub(-1 * #l_0_18) == l_0_18 then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

