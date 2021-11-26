def test_hire_exception
  assert_raises(NoExperienceError) { employee.hire }
end