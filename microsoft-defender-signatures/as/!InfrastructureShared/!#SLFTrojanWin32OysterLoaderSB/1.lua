-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32OysterLoaderSB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.IOAVGetDownloadUrl)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = "^https?:\\/\\/[^\\/]+\\/(?:gov|secure)\\/[0-9a-fA-F]{64}$"
local l_0_2, l_0_3 = (MpCommon.StringRegExpSearch)(l_0_1, l_0_0)
do
  if l_0_2 then
    local l_0_4 = (mp.GetCertificateInfo)()
    for l_0_8,l_0_9 in pairs(l_0_4) do
      if l_0_9.Signers == nil then
        return mp.CLEAN
      end
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

