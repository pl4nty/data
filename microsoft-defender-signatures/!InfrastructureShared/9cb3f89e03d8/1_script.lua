-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9cb3f89e03d8\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
if not contains(l_0_0, (MpCommon.ExpandEnvironmentVariables)("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC25: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC26: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC27: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC28: Overwrote pending register: R4 in 'AssignReg'

if not (":\\windows\\")(":\\users\\public\\", ":\\recovery\\") then
  return mp.CLEAN
end
local l_0_2 = (bm.get_current_process_startup_info)()
do
  do
    if l_0_2 ~= nil and l_0_2.command_line ~= nil then
      local l_0_3 = {}
      -- DECOMPILER ERROR at PC48: No list found for R3 , SetList fails

      -- DECOMPILER ERROR at PC49: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC50: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC51: Overwrote pending register: R6 in 'AssignReg'

      if ("mega")("webdav", "copy") then
        (bm.add_threat_file)(l_0_0)
        reportSessionInformation()
        return mp.INFECTED
      end
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

