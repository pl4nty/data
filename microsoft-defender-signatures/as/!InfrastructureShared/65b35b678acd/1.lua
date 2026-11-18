-- Threat: !InfrastructureShared
-- Name: 65b35b678acd
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = {
  "weather.exe",
  "weathertab.exe",
  "tone.exe",
  "strength.exe",
  "energy.exe",
  "entertainment.exe",
  "bloom.exe",
  "health.exe",
  "healthy.exe",
  "cash.exe",
  "calculator.exe",
  "diet.exe",
  "musicalm.exe",
  "mp3converter.exe",
  "pdfconverter.exe",
  "pdftoword.exe",
  "prime.exe",
  "routes.exe",
  "markets.exe",
  "pacmanpc.exe",
  "valerie.exe",
  "youtubetomp3.exe",
  "youtubedownloader.exe"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_3 == l_0_0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
