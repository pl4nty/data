-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3a311915a\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.PathToWin32Path)((bm.get_imagepath)())
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if not contains(l_0_0, (MpCommon.ExpandEnvironmentVariables)("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC35: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC36: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC37: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC38: Overwrote pending register: R4 in 'AssignReg'

if not (":\\windows\\")(":\\users\\public\\", ":\\recovery\\") then
  return mp.CLEAN
end
local l_0_2 = (bm.get_current_process_startup_info)()
do
  do
    if l_0_2 ~= nil and l_0_2.command_line ~= nil then
      local l_0_3 = {}
      -- DECOMPILER ERROR at PC55: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC56: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC57: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC58: No list found for R3 , SetList fails

      -- DECOMPILER ERROR at PC59: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC60: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC61: Overwrote pending register: R6 in 'AssignReg'

      if ("mega")("c:\\temp\\", "\\downloads\\") then
        (bm.add_related_file)(l_0_0)
        reportSessionInformation()
        return mp.INFECTED
      end
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

