-- Threat: \xac!MpTamperDisableFeatureWd.D
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: MpTamperDisableFeatureWd_C

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 then
  local l_0_1 = {
    {
      "\\windows\\ccm\\",
      ""
    },
    {
      "",
      "\\windows\\ccm\\"
    }
  }
  local l_0_2 = checkParentCmdlineCaseInsensitive(l_0_0, l_0_1, 5)
  if l_0_2 then
    return mp.CLEAN
  end
end
return mp.INFECTED
