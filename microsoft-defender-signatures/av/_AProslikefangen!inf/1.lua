-- Threat: \xa5AProslikefan.gen!inf
-- Type: 13
-- MpAttributes: SCRIPT:Worm:JS/Proslikefan.inf1 & SCRIPT:Worm:JS/Proslikefan.inf2 & SCRIPT:Worm:JS/Proslikefan.inf3 & SCRIPT:Worm:JS/Proslikefan.inf4 & SCRIPT:Worm:JS/Proslikefan.inf5

if mp.getfilesize() > 2700 and mp.getfilesize() < 4400 then
  return mp.INFECTED
end
return mp.CLEAN
