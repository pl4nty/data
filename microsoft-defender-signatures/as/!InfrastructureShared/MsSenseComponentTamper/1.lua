-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\MsSenseComponentTamper\1.luac 

-- params : ...
-- function num : 0
if Remediation ~= nil and Remediation.Threat ~= nil and (Remediation.Threat).Name ~= nil and (string.match)((Remediation.Threat).Name, "Behavior:Win32/MsSenseComponentTamper.A") then
  local l_0_0 = "BmMsSenseComponentTamperA"
  local l_0_1 = GetRollingQueue(l_0_0)
  if not isnull(l_0_1) then
    for l_0_5 in pairs(l_0_1) do
      local l_0_6 = (l_0_1[l_0_5]).key
      if l_0_6 ~= nil and (sysio.IsFileExists)(l_0_6) then
        local l_0_7 = (l_0_1[l_0_5]).value
        if l_0_7 ~= nil and StringEndsWith((string.lower)(l_0_7), ":\\program files\\windows defender advanced threat protection\\mssense.dll") then
          (sysio.MoveFile)(l_0_6, l_0_7)
          do
            do
              local l_0_8 = "O:S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464D:P(A;;FA;;;S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464)(A;;GRGX;;;S-1-15-2-1)(A;;GRGX;;;S-1-15-2-2)(A;;GRGX;;;S-1-5-18)(A;;GRGX;;;S-1-5-32-544)(A;;GRGX;;;S-1-5-32-545)"
              ;
              (sysio.ApplyFsSddl)(l_0_7, l_0_8, false, false)
              do break end
              -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    EraseRollingQueue(l_0_0)
  end
end

