-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:UEFI/LogoFAIL.A
-- Type: 13
-- MpAttributes: MpUefiStreamRtpScan

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_UEFISTREAM then
  return mp.CLEAN
end
local l_0_0 = {
  "bmpdecoderdxe",
  "tgadecoderdxe",
  "pngdecoderdxe",
  "jpegdecoderdxe",
  "pcxdecoderdxe",
  "gifdecoderdxe",
  "amitse",
  "systemimagedecoderdxe",
  "efioembadgingprotocol"
}
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if string.find(l_0_1, l_0_3, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
