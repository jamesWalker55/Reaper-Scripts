-- Get "audio files" path
-- retval1, audiopath = reaper.GetSetProjectInfo_String( 0, "RECORD_PATH", "", false )

-- Get full path of project, empty if not saved
aa, fullpath = reaper.EnumProjects(-1, '')

-- isolate project name from fullpath
projname = string.gsub((string.gsub(fullpath, ".rpp", "")), ".*\\", "")

audiopath = "Audio Files "..projname


-- if project is saved / name NOT empty
if projname ~= "" then
    reaper.GetSetProjectInfo_String( 0, "RECORD_PATH", audiopath, true )
    projstate = "saved"
    return true
else
    projstate = "unsaved"
    return false
end

