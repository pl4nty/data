-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69b356c46148\0x0000c3e6_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  local l_0_2 = nil
  if contains(l_0_2, {".githubusercontent.com", "anonfiles.com", "cdn.discordapp.com", "ddns.net", "dl.dropboxusercontent.com", "ghostbin.co", "glitch.me", "gofile.io", "hastebin.com", "mediafire.com", "mega.nz", "onrender.com", "pages.dev", "paste.ee", "paste.gg", "pastebin.com", "pastebin.pl", "pastetext.net", "pixeldrain.com", "privatlab.com", "privatlab.net", "send.exploit.in", "sendspace.com", "storage.googleapis.com", "storjshare.io", "supabase.co", "temp.sh", "transfer.sh", "trycloudflare.com", "ufile.io", "w3spaces.com", "workers.dev", "bit.ly", "bitly.com", "bitbucket.org", "textbin.net", "j.mp"}) then
    (bm.add_related_string)("BitsPublicStager_cmdline", l_0_2, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
  return mp.CLEAN
end

