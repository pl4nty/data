-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLinuxFileChangeInWorldWritablePath\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if l_0_1 == nil or l_0_1 > 10485760 then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or #l_0_2 < 4 then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC68: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC69: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC70: Overwrote pending register: R5 in 'AssignReg'

for l_0_7,l_0_8 in ("/var/tmp/mkinitramfs")("/ansible") do
  -- DECOMPILER ERROR at PC73: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC75: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC77: Overwrote pending register: R12 in 'AssignReg'

  if (("-salt-").find)("/tmp/go-build", "/var/intel", "/var/cache", true) then
    return mp.CLEAN
  end
end
do
  local l_0_9 = {}
  -- DECOMPILER ERROR at PC92: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC93: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC94: Overwrote pending register: R6 in 'AssignReg'

  for l_0_13,l_0_14 in ("/var/tmp/")("/tmp/") do
    if l_0_2:sub(1, #l_0_14) == l_0_14 then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

