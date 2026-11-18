-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspAppDownload.FA
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (BM_MACHO64_FILE | (BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen))

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_3 = string.match(l_0_1, "/([^/]+%.app)/contents/macos")
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = mp.GetCertificateInfo()
if l_0_4 == nil or 0 < #l_0_4 then
  return mp.CLEAN
end
local l_0_5 = {
  "cleanmymac",
  "termius",
  "adobe photoshop",
  "adobe acrobat",
  "pdf editor",
  "google docs",
  "google drive",
  "google calendar",
  "chrome helper",
  "lastpass",
  "1password",
  "malwarebytes",
  "audacity",
  "dropbox",
  "shopify",
  "thunderbird",
  "davinci resolve",
  "metatrader",
  "hootsuite",
  "notion",
  "safari",
  "office",
  "chrome",
  "word",
  "excel",
  "nordvpn",
  "express vpn",
  "iPhone Backup",
  "teamviewer"
}
local l_0_6 = {
  "free",
  "download",
  "pro",
  "generator",
  "license",
  "keygen",
  "activator",
  "crack",
  "full version",
  "antivirus",
  "resume",
  "activation",
  "torrent"
}
for l_0_7, l_0_8 in pairs(l_0_5) do
  if l_0_8 ~= nil and string.find(l_0_3, l_0_8, 1, true) then
    for l_0_9, l_0_10 in pairs(l_0_6) do
      if l_0_10 ~= nil and string.find(l_0_3, l_0_10, 1, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
