-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\OldZbot\3.luac 

-- params : ...
-- function num : 0
local l_0_0 = Remediation.Threat
if not l_0_0 or type(l_0_0.Name) ~= "string" then
  return 
end
local l_0_1 = l_0_0.Name
if Infrastructure_OldZbotIsOneXThread(l_0_1) then
  (MpCommon.SetGlobalMpAttribute)("SYSCLEAN:Zbot_scan_begin")
end
if Infrastructure_OldZbotIsTwoXDetection(l_0_1) then
  (MpCommon.SetGlobalMpAttribute)("SYSCLEAN:Zbot_2x_scan_begin")
  if l_0_0.Active then
    (Remediation.SetRebootRequired)()
  end
end
if Infrastructure_OldZbotIsOneXCleanup(l_0_1) then
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC60: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC61: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC62: Overwrote pending register: R4 in 'AssignReg'

  local l_0_3 = ("bootlist32.exe")("bootwindows.exe", false)
  local l_0_4 = Infrastructure_OldZbotExpandPaths("%appdata%", true)
  for l_0_8,l_0_9 in pairs(l_0_4) do
    -- DECOMPILER ERROR at PC73: Overwrote pending register: R10 in 'AssignReg'

  end
  for l_0_13,l_0_14 in pairs(l_0_3) do
    -- DECOMPILER ERROR at PC83: Overwrote pending register: R11 in 'AssignReg'

    for l_0_18,l_0_19 in ipairs("sdra64.exe") do
      -- DECOMPILER ERROR at PC86: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC88: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC89: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC90: Overwrote pending register: R18 in 'AssignReg'

      (("unic128.exe").DeleteFile)("userinit32.exe" .. "win32old.exe" .. "windows64.exe")
    end
  end
  if type(l_0_0.Resources) == "table" then
    for l_0_23,l_0_24 in pairs(l_0_0.Resources) do
      if l_0_24.Schema == "file" and type(l_0_24.Path) == "string" then
        (sysio.DeleteFile)(l_0_24.Path)
      end
    end
  end
else
  do
    if Infrastructure_OldZbotIsFullScanThreat(l_0_1) and type(l_0_0.RemovalPolicy) == "number" then
      (Remediation.SetRemovalPolicy)((crypto.bitor)(l_0_0.RemovalPolicy, 4))
    end
    if Infrastructure_OldZbotIsTwoXThread(l_0_1) then
      local l_0_25 = Infrastructure_OldZbotGetTwoXCandidates()
      if next(l_0_25) then
        for l_0_29,l_0_30 in ipairs(l_0_25) do
          local l_0_31 = (sysio.RegOpenKey)(l_0_30.run_key_name)
          if l_0_31 then
            (sysio.DeleteRegValue)(l_0_31, l_0_30.value_name)
          end
        end
        local l_0_32 = (sysio.RegOpenKey)("HKLM\\SOFTWARE\\Microsoft\\RemovalTools")
        if l_0_32 then
          (sysio.DeleteRegValue)(l_0_32, "mpts")
        end
      end
    end
    do
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

