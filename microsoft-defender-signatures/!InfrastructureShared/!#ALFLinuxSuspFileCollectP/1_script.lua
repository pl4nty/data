-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLinuxSuspFileCollectP\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "9d61afa0-cfa4-4746-95af-dc897a6f6774" and l_0_0:lower() ~= "73a99e52-c380-4b86-9d47-fe1cb231f222" then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or #l_0_2 < 4 then
  return mp.CLEAN
end
if (mp.getfilesize)() > 104857600 then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC67: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC68: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC69: Overwrote pending register: R5 in 'AssignReg'

for l_0_7,l_0_8 in ("/usr/")("/var/lib/") do
  -- DECOMPILER ERROR at PC72: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC72: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC73: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC74: Overwrote pending register: R12 in 'AssignReg'

  if ("/opt/")("/etc/", "/snap/", "/proc/") == l_0_8 then
    return mp.CLEAN
  end
end
do
  local l_0_9 = {}
  -- DECOMPILER ERROR at PC92: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC109: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC110: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC111: Overwrote pending register: R6 in 'AssignReg'

  for l_0_13,l_0_14 in ("/ansible")("/snap/") do
    -- DECOMPILER ERROR at PC114: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC116: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC117: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC118: Overwrote pending register: R13 in 'AssignReg'

    if (("/tmp/go-build").find)("/var/intel", "/var/cache", "/sbin/", true) then
      return mp.CLEAN
    end
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

