-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5fd714baf50a\1.luac 

-- params : ...
-- function num : 0
if IsBasToolProcessForPpid("CMDHSTR", "SafeBreach") or IsBasToolProcessFoundInParents("CMDHSTR", "SafeBreach", 4) then
  (mp.set_mpattribute)("TEL:HackTool:Win32/ValidDomainAccounts.A!bas")
end
return mp.INFECTED

