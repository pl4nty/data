-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\124d799229cff\0x0000c46a_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 == nil or l_0_1.ppid == nil or l_0_1.ppid == "" then
  return mp.CLEAN
end
local l_0_2 = (mp.GetProcessCommandLine)(l_0_1.ppid)
local l_0_3 = (mp.GetExecutablesFromCommandLine)(l_0_2)
local l_0_4 = {}
l_0_4[".bat"] = true
l_0_4[".cmd"] = true
l_0_4[".ps1"] = true
local l_0_5 = 4
do
  local l_0_6 = {}
  -- DECOMPILER ERROR at PC48: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC49: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC50: Overwrote pending register: R8 in 'AssignReg'

  for l_0_10,l_0_11 in (":\\saw\\system\\sawhealthcheck.ps1$")(":\\saw\\user\\sawhealthcheck.ps1$") do
    -- DECOMPILER ERROR at PC53: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC55: Overwrote pending register: R13 in 'AssignReg'

    if l_0_5 < (string.len)(l_0_11) then
      local l_0_12 = l_0_11:lower()
      -- DECOMPILER ERROR at PC68: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC69: Overwrote pending register: R15 in 'AssignReg'

      local l_0_13 = (string.sub)(":\\svcfab\\_app\\.+\\svc\\setupnightwatch.bat$", ":\\work\\cloudtest\\preconfig.cmd$")
      if l_0_4[l_0_13] then
        local l_0_14 = false
        -- DECOMPILER ERROR at PC76: Overwrote pending register: R16 in 'AssignReg'

        for l_0_18,l_0_19 in pairs("%w\\bin\\defender%-exclusions.ps1$") do
          if (string.find)(l_0_12, l_0_19, 1, false) then
            break
          end
        end
        do
          if not l_0_14 and (sysio.IsFileExists)(l_0_11) then
            AppendToRollingQueue("ShellScripts", l_0_0 .. ",FilePath:" .. l_0_11, l_0_11, 3600, 100, 1)
            local l_0_20 = mp.ReportLowfi
            local l_0_21 = l_0_11
            local l_0_22 = 4064046355
            local l_0_23 = {}
            l_0_20(l_0_21, l_0_22, l_0_23)
          end
          do
            -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

