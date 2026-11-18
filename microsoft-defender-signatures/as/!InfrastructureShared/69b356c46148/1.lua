-- Threat: !InfrastructureShared
-- Name: 69b356c46148
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1 = {
  ".githubusercontent.com",
  "anonfiles.com",
  "cdn.discordapp.com",
  "ddns.net",
  "dl.dropboxusercontent.com",
  "ghostbin.co",
  "glitch.me",
  "gofile.io",
  "hastebin.com",
  "mediafire.com",
  "mega.nz",
  "onrender.com",
  "pages.dev",
  "paste.ee",
  "paste.gg",
  "pastebin.com",
  "pastebin.pl",
  "pastetext.net",
  "pixeldrain.com",
  "privatlab.com",
  "privatlab.net",
  "send.exploit.in",
  "sendspace.com",
  "storage.googleapis.com",
  "storjshare.io",
  "supabase.co",
  "temp.sh",
  "transfer.sh",
  "trycloudflare.com",
  "ufile.io",
  "w3spaces.com",
  "workers.dev",
  "bit.ly",
  "bitly.com",
  "bitbucket.org",
  "textbin.net",
  "j.mp"
}
if contains(l_0_0, l_0_1) then
  bm.add_related_string("BitsPublicStager_cmdline", l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
