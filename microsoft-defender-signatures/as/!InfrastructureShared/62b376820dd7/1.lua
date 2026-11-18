-- Threat: !InfrastructureShared
-- Name: 62b376820dd7
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = 150000000
local l_0_1 = bm.GetSignatureMatchDuration()
if l_0_0 < l_0_1 then
  return mp.CLEAN
end
if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  local l_0_2 = this_sigattrlog[2].utf8p1
  local l_0_3, l_0_4, l_0_5 = l_0_2:match("[^>](.-)([^\\/]-%.?([^%.\\/]*))$")
  if l_0_4 == nil then
    return mp.CLEAN
  end
  local l_0_6 = {
    "wget",
    "curl",
    "ssh",
    "sshd",
    "openssl",
    "ccrypt",
    "gpg",
    "shred",
    "dd",
    "bash",
    "tcsh",
    "ksh",
    "dash",
    "zsh"
  }
  for l_0_7, l_0_8 in pairs(l_0_6) do
    if string.find(l_0_4, l_0_8, 1, true) then
      return mp.CLEAN
    end
  end
end
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1036.003", "CopyLolbin_DefenseEvasion")
RemediateProcessTreeForLinux()
return mp.INFECTED
