///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class GetUserPlan {
/*
{
  "name": "Medium",
  "space": 400,
  "private_repos": 20,
  "collaborators": 0
} 
*/

  String? name;
  int? space;
  int? privateRepos;
  int? collaborators;

  GetUserPlan({
    this.name,
    this.space,
    this.privateRepos,
    this.collaborators,
  });
  GetUserPlan.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    space = json['space']?.toInt();
    privateRepos = json['private_repos']?.toInt();
    collaborators = json['collaborators']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['space'] = space;
    data['private_repos'] = privateRepos;
    data['collaborators'] = collaborators;
    return data;
  }
}

class GetUser {
/*
{
  "login": "octocat",
  "id": 1,
  "node_id": "MDQ6VXNlcjE=",
  "avatar_url": "https://github.com/images/error/octocat_happy.gif",
  "gravatar_id": "",
  "url": "https://api.github.com/users/octocat",
  "html_url": "https://github.com/octocat",
  "followers_url": "https://api.github.com/users/octocat/followers",
  "following_url": "https://api.github.com/users/octocat/following{/other_user}",
  "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
  "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
  "organizations_url": "https://api.github.com/users/octocat/orgs",
  "repos_url": "https://api.github.com/users/octocat/repos",
  "events_url": "https://api.github.com/users/octocat/events{/privacy}",
  "received_events_url": "https://api.github.com/users/octocat/received_events",
  "type": "User",
  "site_admin": false,
  "name": "monalisa octocat",
  "company": "GitHub",
  "blog": "https://github.com/blog",
  "location": "San Francisco",
  "email": "octocat@github.com",
  "hireable": false,
  "bio": "There once was...",
  "twitter_username": "monatheoctocat",
  "public_repos": 2,
  "public_gists": 1,
  "followers": 20,
  "following": 0,
  "created_at": "2008-01-14T04:33:35Z",
  "updated_at": "2008-01-14T04:33:35Z",
  "private_gists": 81,
  "total_private_repos": 100,
  "owned_private_repos": 100,
  "disk_usage": 10000,
  "collaborators": 8,
  "two_factor_authentication": true,
  "plan": {
    "name": "Medium",
    "space": 400,
    "private_repos": 20,
    "collaborators": 0
  }
} 
*/

  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  bool? hireable;
  String? bio;
  String? twitterUsername;
  int? publicRepos;
  int? publicGists;
  int? followers;
  int? following;
  String? createdAt;
  String? updatedAt;
  int? privateGists;
  int? totalPrivateRepos;
  int? ownedPrivateRepos;
  int? diskUsage;
  int? collaborators;
  bool? twoFactorAuthentication;
  GetUserPlan? plan;

  GetUser({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
    this.privateGists,
    this.totalPrivateRepos,
    this.ownedPrivateRepos,
    this.diskUsage,
    this.collaborators,
    this.twoFactorAuthentication,
    this.plan,
  });
  GetUser.fromJson(Map<String, dynamic> json) {
    login = json['login']?.toString();
    id = json['id']?.toInt();
    nodeId = json['node_id']?.toString();
    avatarUrl = json['avatar_url']?.toString();
    gravatarId = json['gravatar_id']?.toString();
    url = json['url']?.toString();
    htmlUrl = json['html_url']?.toString();
    followersUrl = json['followers_url']?.toString();
    followingUrl = json['following_url']?.toString();
    gistsUrl = json['gists_url']?.toString();
    starredUrl = json['starred_url']?.toString();
    subscriptionsUrl = json['subscriptions_url']?.toString();
    organizationsUrl = json['organizations_url']?.toString();
    reposUrl = json['repos_url']?.toString();
    eventsUrl = json['events_url']?.toString();
    receivedEventsUrl = json['received_events_url']?.toString();
    type = json['type']?.toString();
    siteAdmin = json['site_admin'];
    name = json['name']?.toString();
    company = json['company']?.toString();
    blog = json['blog']?.toString();
    location = json['location']?.toString();
    email = json['email']?.toString();
    hireable = json['hireable'];
    bio = json['bio']?.toString();
    twitterUsername = json['twitter_username']?.toString();
    publicRepos = json['public_repos']?.toInt();
    publicGists = json['public_gists']?.toInt();
    followers = json['followers']?.toInt();
    following = json['following']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    privateGists = json['private_gists']?.toInt();
    totalPrivateRepos = json['total_private_repos']?.toInt();
    ownedPrivateRepos = json['owned_private_repos']?.toInt();
    diskUsage = json['disk_usage']?.toInt();
    collaborators = json['collaborators']?.toInt();
    twoFactorAuthentication = json['two_factor_authentication'];
    plan = (json['plan'] != null) ? GetUserPlan.fromJson(json['plan']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['login'] = login;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['avatar_url'] = avatarUrl;
    data['gravatar_id'] = gravatarId;
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['followers_url'] = followersUrl;
    data['following_url'] = followingUrl;
    data['gists_url'] = gistsUrl;
    data['starred_url'] = starredUrl;
    data['subscriptions_url'] = subscriptionsUrl;
    data['organizations_url'] = organizationsUrl;
    data['repos_url'] = reposUrl;
    data['events_url'] = eventsUrl;
    data['received_events_url'] = receivedEventsUrl;
    data['type'] = type;
    data['site_admin'] = siteAdmin;
    data['name'] = name;
    data['company'] = company;
    data['blog'] = blog;
    data['location'] = location;
    data['email'] = email;
    data['hireable'] = hireable;
    data['bio'] = bio;
    data['twitter_username'] = twitterUsername;
    data['public_repos'] = publicRepos;
    data['public_gists'] = publicGists;
    data['followers'] = followers;
    data['following'] = following;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['private_gists'] = privateGists;
    data['total_private_repos'] = totalPrivateRepos;
    data['owned_private_repos'] = ownedPrivateRepos;
    data['disk_usage'] = diskUsage;
    data['collaborators'] = collaborators;
    data['two_factor_authentication'] = twoFactorAuthentication;
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    return data;
  }
}
