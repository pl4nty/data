-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a7b1_1344.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 ~= nil and l_0_0 > 20971520 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 4 then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC39: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC40: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC41: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("/usr/")("/var/lib/") do
  -- DECOMPILER ERROR at PC44: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC44: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC45: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC46: Overwrote pending register: R11 in 'AssignReg'

  if ("/opt/")("/etc/", "/snap/", "/boot/") == l_0_7 then
    return mp.CLEAN
  end
end
do
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC64: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC90: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC91: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC92: Overwrote pending register: R5 in 'AssignReg'

  for l_0_12,l_0_13 in ("/altair/")("-altair.") do
    -- DECOMPILER ERROR at PC95: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC97: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC98: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC99: Overwrote pending register: R12 in 'AssignReg'

    if (("/ansys_").find)("/ansys/", "nginx", "/proc/", true) then
      return mp.CLEAN
    end
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

