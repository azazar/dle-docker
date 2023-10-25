# DataLife Engine Docker Image

This is a Docker image for the trial version of DataLife Engine.

## Description

This Docker image allows you to quickly set up a trial version of DataLife Engine, a popular content management system.

## Usage

To use this Docker image, run the following command:

```bash
docker run -p 80:80 azazar/dle:trial
```

Then, open your web browser and navigate to `http://localhost` to start the DataLife Engine installation process.

## Building

To build this Docker image, run the following command:

```bash
docker build . -t azazar/dle:trial
```

## Environment Variables

This Docker image uses the following environment variables:

- `MYSQL_DATABASE`: The name of the MySQL database to be created. Default is `dle_db`.
- `MYSQL_USER`: The username for the MySQL account to be created. Default is `dle_user`.
- `MYSQL_PASSWORD`: The password for the MySQL account to be created. Default is `dle_password`.

You can set these variables when running the Docker image using the `-e` option. For example:

```bash
docker run -p 80:80 -e MYSQL_DATABASE=mydatabase -e MYSQL_USER=myuser -e MYSQL_PASSWORD=mypassword azazar/dle:trial
```

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/azazar/dle-docker/blob/main/LICENSE) file for details.
