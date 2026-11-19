-- Threat: !InfrastructureShared
-- Name: a8b3251f584a
-- Type: 21
-- Includes: BMLuaLib

bm.DisableSignature()
local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if not contains(l_0_1, "downloadstring") then
    return mp.CLEAN
  end
  l_0_0 = l_0_1
end
local l_0_2 = {
  "iex",
  "invoke-expression"
}
if not contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "github.com",
  "raw.githubusercontent.com",
  "bit.ly",
  "bitly.com",
  "bitbucket.org",
  "dropbox.com",
  "transfer.sh",
  "webhook.site",
  "ufile.io",
  "downloads.level.io"
}
if contains(l_0_0, l_0_3) then
  bm.add_related_string("PSPublicStager_cmdline", l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
