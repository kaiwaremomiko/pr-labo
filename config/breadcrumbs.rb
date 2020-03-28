crumb :root do
  link "Home", root_path
end

crumb :root do
  link 'TOP', root_path
end

crumb :companies do
  link '企業一覧', companies_path
end

crumb :npos do
  link 'NPO一覧', npos_path
end

crumb :occupations do
  link '職業一覧', occupations_path
end

crumb :company do |company|
  link "#{company.corporate_name}", company_path(company)
  parent :companies
end

crumb :npo do |npo|
  link "#{npo.corporate_name}", npo_path(npo)
  parent :npos
end

crumb :occupation do |occupation|
  link "#{occupation.occupation_name}", occupation_path(occupation)
  parent :occupations
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).