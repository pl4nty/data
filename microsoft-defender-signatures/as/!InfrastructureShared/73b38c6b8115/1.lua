-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b38c6b8115\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil or (this_sigattrlog[3]).utf8p1 == "" then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[3]).utf8p1
do
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC32: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC33: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC34: Overwrote pending register: R3 in 'AssignReg'

  for l_0_5,l_0_6 in ("/tmp/test10")("/private/tmp/test10") do
    -- DECOMPILER ERROR at PC37: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC39: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC40: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC41: Overwrote pending register: R10 in 'AssignReg'

    if (("/Library/PrivilegedHelperTools/us.zoom.ZoomHelperTool").find)("/usr/local/bin/com.docker.vmnat", "/usr/local/bin/com.docker.vmnat.lock", "/Library/PrivilegedHelperTools/com.microsoft.teams.TeamsDaemon", true) == 1 then
      if (sysio.IsFileExists)(l_0_0) then
        (bm.add_threat_file)(l_0_0)
      end
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

