function onEvent(eventName, value1, value2)
    if eventName == 'NoteAlphaTweenP'
        for i = 4, 7 do
            noteTweenAlpha('noteAlpha'..i, i, value1, value2, 'linear')
        end
    elseif eventName == 'NoteAlphaTweenO'
        for i = 0, 3 do
            noteTweenAlpha('noteAlpha'..i, i, value1, value2, 'linear')
        end
    end
end