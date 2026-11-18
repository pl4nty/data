-- Threat: \x89ARusem.gen!A
-- Type: 13
-- MpAttributes: SCRIPT:TrojanDownloader:JS/Adodb.1 & SCRIPT:TrojanDownloader:JS/Rusem.1 & SCRIPT:TrojanDownloader:JS/Rusem.2

if mp.getfilesize() < 2300 then
  return mp.INFECTED
end
return mp.CLEAN
