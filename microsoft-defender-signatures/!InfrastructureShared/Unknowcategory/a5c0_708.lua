-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a5c0_708.luac 

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

  if ("/opt/")("/etc/", "/snap/", "/sbin/") == l_0_6 then
    return mp.CLEAN
  end
end
do
  local l_0_7 = {}
  -- DECOMPILER ERROR at PC49: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC50: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC51: Overwrote pending register: R4 in 'AssignReg'

  for l_0_11,l_0_12 in ("/usr/bin/snap")("/amazon-ssm-agent/") do
    -- DECOMPILER ERROR at PC58: Overwrote pending register: R11 in 'AssignReg'

    if (string.find)(l_0_0, l_0_12, "/proc/", true) then
      return mp.CLEAN
    end
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

