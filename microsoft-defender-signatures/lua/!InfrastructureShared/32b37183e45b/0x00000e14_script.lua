-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b37183e45b\0x00000e14_luac 

-- params : ...
-- function num : 0
local l_0_0 = "AadTenantID"
local l_0_1 = (GetRollingQueueKeys(l_0_0))
local l_0_2 = nil
if l_0_1 and type(l_0_1) == "table" and l_0_1[1] then
  l_0_2 = l_0_1[1]
else
  local l_0_3 = "HKLM\\SYSTEM\\CurrentControlSet\\Control\\CloudDomainJoin\\TenantInfo\\"
  local l_0_4 = (sysio.RegOpenKey)(l_0_3)
  if l_0_4 then
    local l_0_5 = (sysio.RegEnumKeys)(l_0_4)
    if l_0_5 then
      for l_0_9,l_0_10 in ipairs(l_0_5) do
        if l_0_10 and type(l_0_10) == "string" and l_0_10:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
          l_0_2 = l_0_10
          local l_0_11 = 2592000
          do
            do
              local l_0_12 = 10
              AppendToRollingQueue(l_0_0, l_0_2, 1, l_0_11, l_0_12)
              do break end
              -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end
if l_0_2 then
  l_0_3 = bm
  l_0_3 = l_0_3.add_related_string
  l_0_4 = "aadtenantid"
  l_0_5 = l_0_2
  l_0_3(l_0_4, l_0_5, bm.RelatedStringBMReport)
end
l_0_3 = mp
l_0_3 = l_0_3.INFECTED
return l_0_3

