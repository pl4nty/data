-- Threat: !InfrastructureShared
-- Name: 27293034f977
-- Type: 21

local l_0_0 = mp.getfilesize()
if 91920 < l_0_0 then
  return mp.CLEAN
end
if mp.get_mpattribute("SCPT:JS/Lazarus.HB1") or mp.get_mpattribute("SCPT:JS/Lazarus.HB2") or mp.get_mpattribute("SCPT:JS/Lazarus.HB5") then
  mp.readprotection(false)
  local l_0_1 = tostring(mp.readfile(0, l_0_0))
  mp.readprotection(true)
  if l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  if not mp.get_mpattribute("SCPT:JS/Lazarus.HB1") and not string.find(l_0_1, "async function checkethereumw()", 1, true) then
    return mp.CLEAN
  end
  if string.find(l_0_1, "'bitcoinSegwit'", 1, true) and string.find(l_0_1, "bitcoincash:", 1, true) and string.find(l_0_1, "'solana2'", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
