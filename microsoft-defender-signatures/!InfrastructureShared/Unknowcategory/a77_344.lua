-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a77_344.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
do
  if l_0_0 ~= nil and l_0_0 ~= "" then
    local l_0_1 = (string.lower)((mp.GetProcessCommandLine)(l_0_0))
    if l_0_1 ~= nil and l_0_1 ~= "" then
      (mp.set_mpattribute)((string.format)("MpInternal_researchdata=fullcmd=%s", l_0_1))
    end
  end
  return mp.INFECTED
end

