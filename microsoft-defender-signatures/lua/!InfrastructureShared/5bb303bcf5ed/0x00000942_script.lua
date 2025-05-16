-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb303bcf5ed\0x00000942_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC32: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC33: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC34: Overwrote pending register: R5 in 'AssignReg'

  for l_0_7,l_0_8 in ("/usr/local/bin/com.docker.sock")("/Library/PrivilegedHelperTools/us.zoom.ZoomHelperTool") do
    -- DECOMPILER ERROR at PC37: Overwrote pending register: R9 in 'AssignReg'

    if (("/Library/PrivilegedHelperTools/us.zoom.ZoomService").find)(l_0_2, l_0_8, 1, true) == 1 then
      if (sysio.IsFileExists)(l_0_2) then
        (bm.add_threat_file)(l_0_2)
      end
      TrackPidAndTechniqueBM("BM", "T1036.004", "DefenseEvasion_Masquerading_SuspUserAgent")
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

