# Extensive Docs at http://github.com/innku/innsights-gem

Innsights.setup do
  
  user Dude do
    display :username
    group :company do
      display :name
    end
  end

  watch Tweet do
    report 'Tweet'
    upon   :create
    user   :dude
  end

  watch Mention do
    report 'Mention'
    upon   :create
    user   :dude
  end
    
end
