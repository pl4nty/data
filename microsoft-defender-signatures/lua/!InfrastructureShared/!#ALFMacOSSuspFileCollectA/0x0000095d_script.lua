-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFMacOSSuspFileCollectA\0x0000095d_luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "9d61afa0-cfa4-4746-95af-dc897a6f6774" and l_0_0:lower() ~= "3df8d417-1b4f-4b75-b289-5c016058832c" and l_0_0:lower() ~= "73a99e52-c380-4b86-9d47-fe1cb231f222" then
  return mp.CLEAN
end
if (mp.getfilesize)() > 52428800 then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 == nil or l_0_3 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC83: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC84: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC85: Overwrote pending register: R6 in 'AssignReg'

for l_0_8,l_0_9 in ("conductor")("Install-osquery") do
  -- DECOMPILER ERROR at PC90: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC92: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC93: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC94: Overwrote pending register: R13 in 'AssignReg'

  if l_0_9 ~= nil and (("osquery-bandwidth-monitor").find)("register-python-argcomplete", "rollout-smf", "shell_tools", true) then
    return mp.CLEAN
  end
end
do
  do
    -- DECOMPILER ERROR at PC278: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC278: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC278: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC278: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC278: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC278: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC278: Unhandled construct in 'MakeBoolean' P3

    if (string.find)(l_0_2, "/bin", 1, true) == 1 or (((string.find)(l_0_2, "/t/.com.google.chrome.", 1, true) and (string.find)(l_0_2, "/google", 1, true)) or (string.find)(l_0_2, "/usr/", 1, true) ~= 1 or (string.find)(l_0_2, "/applications/microsoft defender.app/", 1, true) == 1) then
      return mp.CLEAN
    end
    if SuspMacPathsToMonitor(l_0_2 .. "/" .. l_0_3, true) then
      return mp.INFECTED
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

